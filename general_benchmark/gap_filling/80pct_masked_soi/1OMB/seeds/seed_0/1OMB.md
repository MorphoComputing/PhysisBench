# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1OMB\sequence\1OMB.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1OMB\seeds\seed_0\1OMB.pdb`
- residues: 33
- mode: oracle
- ca_rmsd: 3.052 A
- tm_score_ca_ordered: 0.31904930407161836
- heavy_atom_rmsd: 5.033 A
- sidechain_heavy_atom_rmsd: 6.278 A
- **all-atom quality (honest):** heavy 5.033 A, sidechain 6.278 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/27 (0.0)
- lj_severe: 0
- lj_near: 9
- distogram_pairs: 205
- bin_accuracy: 0.590

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=rejected_lj_regression tested=30
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 3.051476514682109
- ga_delta_rmsd: 2.519955951230779  ga_fitness_mode: energy
- pre_local_rmsd: 3.0515110210536878  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** —
- explained: 0/1 conflicts by 0 root cause(s)
- metrics: hubs=1 (frac 0.03), conflicts/hub=1.0, max_incompat=2.05Å, chain_span=0.0
- **fix-first:** [LOW_CONFLICT] Root cause(s): — — explain ~0/1 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **C21** — severity 1.12, 1 conflict(s); suspect input ~`G11` (group: pull_in)
  - pull-in (wants closer): G11@10.7Å(now 13.7,conf 0.55)
  - T33↔G11: targets 5.9/10.7Å but partners are 18.6Å apart → too_far_apart by 2.0Å

## Secondary Structure (DSSP-like)

- helix(H)=10 · strand(E)=18 · 3-10(G)=3 · coil(C)=2

```
CHEEHEECEEHEEEEGHEEEGEEEHHHHHEGHE
```

## Backbone H-bond Network

- total=59 · helix(i→i+4)=2 · sheet=57
  - M25 ↔ N29  (helix)
  - T28 ↔ C32  (helix)
  - E3 ↔ T13  (sheet)
  - E3 ↔ K14  (sheet)
  - E3 ↔ C15  (sheet)
  - E3 ↔ P20  (sheet)
  - D4 ↔ R22  (sheet)
  - D4 ↔ C23  (sheet)
  - G6 ↔ T13  (sheet)
  - G6 ↔ K14  (sheet)
  - G6 ↔ C15  (sheet)
  - G6 ↔ R19  (sheet)
  - G6 ↔ P20  (sheet)
  - G6 ↔ R22  (sheet)
  - G6 ↔ C23  (sheet)
  - K7 ↔ G12  (sheet)
  - K7 ↔ T13  (sheet)
  - K7 ↔ K14  (sheet)
  - K7 ↔ C15  (sheet)
  - K7 ↔ G18  (sheet)
  - … +39 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=10 · exposed=14 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=105 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=48 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.8537 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=9 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C8–C21, C15–C32, C23–C30

## Side-chain Rotamers (χ1/χ2)

- 27 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
