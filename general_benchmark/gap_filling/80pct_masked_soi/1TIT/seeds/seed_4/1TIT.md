# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1TIT\sequence\1TIT.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1TIT\seeds\seed_4\1TIT.pdb`
- residues: 87
- mode: oracle
- ca_rmsd: 1.096 A
- tm_score_ca_ordered: 0.9220426779197692
- heavy_atom_rmsd: 2.935 A
- sidechain_heavy_atom_rmsd: 3.770 A
- **all-atom quality (honest):** heavy 2.935 A, sidechain 3.770 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.023
- rotamer_outliers: 0/73 (0.0)
- lj_severe: 0
- lj_near: 8
- distogram_pairs: 1027
- bin_accuracy: 0.876

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=45
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.0960490368559987
- ga_delta_rmsd: 2.30267662866118  ga_fitness_mode: energy
- pre_local_rmsd: 1.1214337330802442  localized_anchor_rmsd: 1.0960701284761316

## Failure Classification

- primary_reason: `BACKBONE_NEAR_MISS_LT_1A`
- reasons: `BACKBONE_NEAR_MISS_LT_1A`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** —
- explained: 0/1 conflicts by 0 root cause(s)
- metrics: hubs=1 (frac 0.011), conflicts/hub=1.0, max_incompat=2.32Å, chain_span=0.0
- **fix-first:** [LOW_CONFLICT] Root cause(s): — — explain ~0/1 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **I1** — severity 1.27, 1 conflict(s); suspect input ~`E26` (group: pull_in)
  - pull-in (wants closer): E87@27.5Å(now 36.8,conf 1.00), F13@27.5Å(now 32.8,conf 1.00), Q63@27.5Å(now 31.3,conf 1.00), N61@27.5Å(now 30.3,conf 1.00), G65@27.5Å(now 30.4,conf 1.00)
  - E87↔E26: targets 27.5/6.7Å but partners are 36.5Å apart → too_far_apart by 2.3Å

## Secondary Structure (DSSP-like)

- helix(H)=7 · strand(E)=51 · 3-10(G)=15 · coil(C)=14

```
CECHEEEECEEEGGHEEEEGEECECECEEEEEEEEHCEGEEGEGGEEGCEEEHEGGGCEEGGEHGHEEECEGEEHCEEECECEECEE
```

## Backbone H-bond Network

- total=102 · helix(i→i+4)=0 · sheet=102
  - E2 ↔ I22  (sheet)
  - K5 ↔ E21  (sheet)
  - K5 ↔ I22  (sheet)
  - K5 ↔ L24  (sheet)
  - P6 ↔ E21  (sheet)
  - P6 ↔ I22  (sheet)
  - P6 ↔ L24  (sheet)
  - L7 ↔ A18  (sheet)
  - L7 ↔ H19  (sheet)
  - L7 ↔ E21  (sheet)
  - L7 ↔ I22  (sheet)
  - L7 ↔ L24  (sheet)
  - Y8 ↔ A18  (sheet)
  - Y8 ↔ H19  (sheet)
  - Y8 ↔ E21  (sheet)
  - Y8 ↔ I22  (sheet)
  - V10 ↔ T17  (sheet)
  - V10 ↔ A18  (sheet)
  - V10 ↔ H19  (sheet)
  - V10 ↔ E21  (sheet)
  - … +82 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=28 · exposed=30 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=353 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=232 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.5219 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=8 (steric clashes)
- ramachandran_forbidden_fraction=0.023

## Side-chain Rotamers (χ1/χ2)

- 73 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
