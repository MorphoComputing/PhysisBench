# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1OMB\sequence\1OMB.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1OMB\seeds\seed_3\1OMB.pdb`
- residues: 33
- mode: oracle
- ca_rmsd: 6.766 A
- tm_score_ca_ordered: 0.13400176358840254
- heavy_atom_rmsd: 7.983 A
- sidechain_heavy_atom_rmsd: 8.820 A
- **all-atom quality (honest):** heavy 7.983 A, sidechain 8.820 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/27 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 205
- bin_accuracy: 0.673

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=rejected_window_topology_regression tested=30
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 6.766175453594991
- ga_delta_rmsd: -1.8138933704575182  ga_fitness_mode: energy
- pre_local_rmsd: 6.7661841307644925  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** —
- explained: 0/2 conflicts by 0 root cause(s)
- metrics: hubs=1 (frac 0.03), conflicts/hub=2.0, max_incompat=3.21Å, chain_span=0.0
- **fix-first:** [LOW_CONFLICT] Root cause(s): — — explain ~0/2 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **C15** — severity 3.35, 2 conflict(s); suspect input ~`A2` (group: pull_in)
  - pull-in (wants closer): A2@6.3Å(now 9.8,conf 0.55)
  - R19↔A2: targets 5.6/6.3Å but partners are 15.1Å apart → too_far_apart by 3.2Å
  - G18↔A2: targets 5.0/6.3Å but partners are 14.2Å apart → too_far_apart by 2.9Å

## Secondary Structure (DSSP-like)

- helix(H)=4 · strand(E)=15 · 3-10(G)=6 · coil(C)=8

```
CCHECECEGEHGGECEHEEEGEEEHEGCCCEGE
```

## Backbone H-bond Network

- total=36 · helix(i→i+4)=0 · sheet=36
  - D4 ↔ K14  (sheet)
  - D4 ↔ C16  (sheet)
  - G6 ↔ K14  (sheet)
  - G6 ↔ C16  (sheet)
  - G6 ↔ G18  (sheet)
  - G6 ↔ R19  (sheet)
  - G6 ↔ P20  (sheet)
  - G6 ↔ R22  (sheet)
  - G6 ↔ C23  (sheet)
  - C8 ↔ K14  (sheet)
  - C8 ↔ C16  (sheet)
  - C8 ↔ G18  (sheet)
  - C8 ↔ R19  (sheet)
  - C8 ↔ P20  (sheet)
  - C8 ↔ R22  (sheet)
  - C8 ↔ C23  (sheet)
  - W10 ↔ P20  (sheet)
  - K14 ↔ R19  (sheet)
  - K14 ↔ P20  (sheet)
  - K14 ↔ R22  (sheet)
  - … +16 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=13 · exposed=12 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=107 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=48 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.8871 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C8–C21, C15–C32, C23–C30

## Side-chain Rotamers (χ1/χ2)

- 27 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
