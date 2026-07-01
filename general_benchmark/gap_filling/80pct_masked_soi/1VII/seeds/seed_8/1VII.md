# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1VII\sequence\1VII.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1VII\seeds\seed_8\1VII.pdb`
- residues: 34
- mode: oracle
- ca_rmsd: 4.083 A
- tm_score_ca_ordered: 0.30628717907086217
- heavy_atom_rmsd: 5.045 A
- sidechain_heavy_atom_rmsd: 5.712 A
- **all-atom quality (honest):** heavy 5.045 A, sidechain 5.712 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/29 (0.0)
- lj_severe: 0
- lj_near: 7
- distogram_pairs: 221
- bin_accuracy: 0.629

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=rejected_local_chirality_regression tested=21
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 4.083236494590813
- ga_delta_rmsd: 3.072574001933421  ga_fitness_mode: energy
- pre_local_rmsd: 4.083311878673728  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** —
- explained: 0/4 conflicts by 0 root cause(s)
- metrics: hubs=3 (frac 0.088), conflicts/hub=1.3, max_incompat=2.43Å, chain_span=0.5
- **fix-first:** [LOW_CONFLICT] Root cause(s): — — explain ~0/4 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **N27** — severity 2.36, 2 conflict(s); suspect input ~`W23` (group: pull_in)
  - pull-in (wants closer): L34@11.4Å(now 14.4,conf 0.67)
  - L34↔W23: targets 11.4/6.1Å but partners are 19.9Å apart → too_far_apart by 2.4Å
  - L22↔L34: targets 7.0/11.4Å but partners are 19.9Å apart → too_far_apart by 1.5Å
- **R14** — severity 0.88, 1 conflict(s); suspect input ~`D3` (group: pull_in)
  - pull-in (wants closer): D3@8.4Å(now 11.3,conf 0.55)
  - push-out (wants farther): G11@8.1Å(now 5.2,conf 0.67)
  - A18↔D3: targets 6.1/8.4Å but partners are 16.1Å apart → too_far_apart by 1.6Å
- **F10** — severity 0.82, 1 conflict(s); suspect input ~`L1` (group: push_out)
  - push-out (wants farther): L1@9.9Å(now 4.4,conf 0.55)
  - F6↔L1: targets 5.2/9.9Å but partners are 3.1Å apart → too_close_together by 1.5Å

## Secondary Structure (DSSP-like)

- helix(H)=16 · strand(E)=11 · 3-10(G)=3 · coil(C)=4

```
CEHHHEHHEHEHEEGHHCHEGEHCHHGEHHHEEC
```

## Backbone H-bond Network

- total=26 · helix(i→i+4)=6 · sheet=20
  - D3 ↔ K7  (helix)
  - E4 ↔ A8  (helix)
  - A8 ↔ M12  (helix)
  - M12 ↔ A16  (helix)
  - N19 ↔ W23  (helix)
  - Q26 ↔ K30  (helix)
  - S2 ↔ V9  (sheet)
  - S2 ↔ G11  (sheet)
  - S2 ↔ T13  (sheet)
  - F6 ↔ G11  (sheet)
  - F6 ↔ T13  (sheet)
  - F6 ↔ R14  (sheet)
  - V9 ↔ R14  (sheet)
  - V9 ↔ L28  (sheet)
  - G11 ↔ L28  (sheet)
  - T13 ↔ L20  (sheet)
  - T13 ↔ L28  (sheet)
  - T13 ↔ K32  (sheet)
  - T13 ↔ G33  (sheet)
  - R14 ↔ L20  (sheet)
  - … +6 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=12 · exposed=15 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=110 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=29 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.9962 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=7 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 29 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
