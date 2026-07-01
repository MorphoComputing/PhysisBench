# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1CRN\sequence\1CRN.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1CRN\seeds\seed_9\1CRN.pdb`
- residues: 44
- mode: oracle
- ca_rmsd: 6.244 A
- tm_score_ca_ordered: 0.3255568982401116
- heavy_atom_rmsd: 7.050 A
- sidechain_heavy_atom_rmsd: 7.802 A
- **all-atom quality (honest):** heavy 7.050 A, sidechain 7.802 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/35 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 327
- bin_accuracy: 0.755

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=rejected_lj_regression tested=33
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 6.243729078470624
- ga_delta_rmsd: -0.2283765313785313  ga_fitness_mode: energy
- pre_local_rmsd: 6.323084792694996  localized_anchor_rmsd: 6.243820401706482

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** —
- explained: 0/1 conflicts by 0 root cause(s)
- metrics: hubs=1 (frac 0.023), conflicts/hub=1.0, max_incompat=1.86Å, chain_span=0.0
- **fix-first:** [LOW_CONFLICT] Root cause(s): — — explain ~0/1 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **S5** — severity 1.01, 1 conflict(s); suspect input ~`G41` (group: pull_in)
  - pull-in (wants closer): G41@10.9Å(now 13.5,conf 0.55)
  - S10↔G41: targets 9.0/10.9Å but partners are 21.8Å apart → too_far_apart by 1.9Å

## Secondary Structure (DSSP-like)

- helix(H)=19 · strand(E)=17 · 3-10(G)=3 · coil(C)=5

```
EEHEEHHHEHEHHHHHCHEEEHCHHGGHGECECCHEEEHEHEHE
```

## Backbone H-bond Network

- total=25 · helix(i→i+4)=7 · sheet=18
  - C3 ↔ V7  (helix)
  - A8 ↔ F12  (helix)
  - F12 ↔ R16  (helix)
  - P18 ↔ E22  (helix)
  - I24 ↔ Y28  (helix)
  - P35 ↔ C39  (helix)
  - C39 ↔ Y43  (helix)
  - T1 ↔ R9  (sheet)
  - T1 ↔ P21  (sheet)
  - C2 ↔ R9  (sheet)
  - P4 ↔ R9  (sheet)
  - P4 ↔ N11  (sheet)
  - S5 ↔ N11  (sheet)
  - N11 ↔ G30  (sheet)
  - P21 ↔ I32  (sheet)
  - G30 ↔ D42  (sheet)
  - G30 ↔ A44  (sheet)
  - I32 ↔ A37  (sheet)
  - I32 ↔ T38  (sheet)
  - I32 ↔ P40  (sheet)
  - … +5 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=15 · exposed=15 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=147 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=50 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.8578 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C2–C39, C3–C31, C15–C25

## Side-chain Rotamers (χ1/χ2)

- 35 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
