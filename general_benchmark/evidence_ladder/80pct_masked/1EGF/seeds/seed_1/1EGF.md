# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/1EGF/sequence/1EGF.pdb`
- output_pdb: `general_benchmark/evidence_ladder/80pct_masked/1EGF/seeds/seed_1/1EGF.pdb`
- residues: 51
- mode: oracle
- ca_rmsd: 3.434 A
- tm_score_ca_ordered: 0.48292686984206795
- heavy_atom_rmsd: 5.027 A
- sidechain_heavy_atom_rmsd: 6.124 A
- **all-atom quality (honest):** heavy 5.027 A, sidechain 6.124 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/45 (0.0)
- lj_severe: 0
- lj_near: 14
- distogram_pairs: 235
- bin_accuracy: 0.647

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=39
- rigid_domain_reconvergence: applied=True accepted=10 rmsd=5.788115721908203 -> 4.634586403827133 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 3.433756801948856
- ga_delta_rmsd: 1.0552520324251229  ga_fitness_mode: energy
- pre_local_rmsd: 3.433807364054141  localized_anchor_rmsd: 3.433807364054141

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** —
- explained: 0/2 conflicts by 0 root cause(s)
- metrics: hubs=2 (frac 0.039), conflicts/hub=1.0, max_incompat=3.14Å, chain_span=0.118
- **fix-first:** [LOW_CONFLICT] Root cause(s): — — explain ~0/2 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **S7** — severity 1.71, 1 conflict(s); suspect input ~`Y28` (group: push_out)
  - push-out (wants farther): S1@18.7Å(now 15.8,conf 0.56), H21@12.5Å(now 9.4,conf 0.55)
  - S1↔Y28: targets 18.7/11.4Å but partners are 4.2Å apart → too_close_together by 3.1Å
- **S1** — severity 1.61, 1 conflict(s); suspect input ~`H21` (group: push_out)
  - push-out (wants farther): S7@18.7Å(now 15.8,conf 0.56)
  - S7↔H21: targets 18.7/6.3Å but partners are 9.4Å apart → too_close_together by 2.9Å

## Secondary Structure (DSSP-like)

- helix(H)=19 · strand(E)=15 · 3-10(G)=9 · coil(C)=8

```
EEHEHEHHEGGGEGHCCECEHGHHCGCEECEGCHHEEGHHEGHHHHHHHEC
```

## Backbone H-bond Network

- total=42 · helix(i→i+4)=7 · sheet=35
  - P3 ↔ S7  (helix)
  - G35 ↔ D39  (helix)
  - D39 ↔ T43  (helix)
  - R40 ↔ R44  (helix)
  - T43 ↔ R47  (helix)
  - R44 ↔ W48  (helix)
  - D45 ↔ W49  (helix)
  - S1 ↔ M20  (sheet)
  - Y2 ↔ M20  (sheet)
  - G4 ↔ Y9  (sheet)
  - G4 ↔ C13  (sheet)
  - G4 ↔ V18  (sheet)
  - G4 ↔ M20  (sheet)
  - P6 ↔ C13  (sheet)
  - P6 ↔ V18  (sheet)
  - P6 ↔ M20  (sheet)
  - Y9 ↔ V18  (sheet)
  - Y9 ↔ M20  (sheet)
  - C13 ↔ V18  (sheet)
  - C13 ↔ M20  (sheet)
  - … +22 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=17 · exposed=25 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=239 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=131 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.0605 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=14 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C19, C13–C30, C32–C41

## Side-chain Rotamers (χ1/χ2)

- 45 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
