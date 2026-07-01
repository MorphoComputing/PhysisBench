# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1FKF\sequence\1FKF.pdb`
- output_pdb: `general_benchmark\evidence_ladder\50pct_masked\1FKF\seeds\seed_1\1FKF.pdb`
- residues: 105
- mode: oracle
- ca_rmsd: 2.149 A
- tm_score_ca_ordered: 0.8553302131094205
- heavy_atom_rmsd: 3.367 A
- sidechain_heavy_atom_rmsd: 4.047 A
- **all-atom quality (honest):** heavy 3.367 A, sidechain 4.047 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/88 (0.0)
- lj_severe: 0
- lj_near: 7
- distogram_pairs: 1721
- bin_accuracy: 0.833

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=48
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 2.148535241764368
- ga_delta_rmsd: -0.30857086883119544  ga_fitness_mode: energy
- pre_local_rmsd: 2.150484648091585  localized_anchor_rmsd: 2.148545459186817

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** Y79-A80 → 20 conflicts (74%); I55-R56 → 3 conflicts (11%); A83 → 3 conflicts (11%)
- explained: 26/27 conflicts by 3 root cause(s)
- metrics: hubs=10 (frac 0.095), conflicts/hub=2.7, max_incompat=4.9Å, chain_span=0.943
- **fix-first:** [LOW_CONFLICT] Root cause(s): Y79-A80 + I55-R56 + A83 — explain ~26/27 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **R56** — severity 10.94, 7 conflict(s); suspect input ~`A83` (group: push_out)
  - push-out (wants farther): P91@17.9Å(now 13.6,conf 0.55), P92@16.9Å(now 12.2,conf 0.55), A83@15.1Å(now 7.9,conf 0.55), G85@14.4Å(now 10.3,conf 0.55)
  - Y79↔A83: targets 5.2/15.1Å but partners are 5.1Å apart → too_close_together by 4.9Å
  - A80↔A83: targets 6.6/15.1Å but partners are 5.3Å apart → too_close_together by 3.2Å
  - P91↔A80: targets 17.9/6.6Å but partners are 8.3Å apart → too_close_together by 3.0Å
- **I55** — severity 6.70, 5 conflict(s); suspect input ~`A83` (group: push_out)
  - push-out (wants farther): P92@15.2Å(now 11.4,conf 0.55), P87@15.2Å(now 6.8,conf 0.55), P91@15.7Å(now 11.4,conf 0.55), A83@14.2Å(now 8.4,conf 0.55), G85@12.1Å(now 8.3,conf 0.55)
  - A80↔A83: targets 5.4/14.2Å but partners are 5.3Å apart → too_close_together by 3.5Å
  - Y79↔A83: targets 6.4/14.2Å but partners are 5.1Å apart → too_close_together by 2.7Å
  - A80↔P92: targets 5.4/15.2Å but partners are 7.5Å apart → too_close_together by 2.4Å
- **A71** — severity 5.37, 4 conflict(s); suspect input ~`Y79` (group: push_out)
  - push-out (wants farther): A83@25.7Å(now 22.0,conf 0.70)
  - A83↔Y79: targets 25.7/17.3Å but partners are 5.1Å apart → too_close_together by 3.3Å
  - A83↔A80: targets 25.7/17.4Å but partners are 5.3Å apart → too_close_together by 3.0Å
  - A83↔G61: targets 25.7/9.2Å but partners are 14.7Å apart → too_close_together by 1.8Å
- **V1** — severity 4.64, 3 conflict(s); suspect input ~`Y79` (group: push_out)
  - push-out (wants farther): A83@16.9Å(now 12.3,conf 0.55)
  - A83↔Y79: targets 16.9/7.5Å but partners are 5.1Å apart → too_close_together by 4.4Å
  - G57↔A83: targets 5.3/16.9Å but partners are 9.5Å apart → too_close_together by 2.1Å
  - A83↔A80: targets 16.9/9.7Å but partners are 5.3Å apart → too_close_together by 2.0Å
- **L73** — severity 3.07, 2 conflict(s); suspect input ~`Y79` (group: push_out)
  - push-out (wants farther): A83@19.5Å(now 16.2,conf 0.57)
  - A83↔Y79: targets 19.5/11.4Å but partners are 5.1Å apart → too_close_together by 3.0Å
  - A83↔A80: targets 19.5/11.6Å but partners are 5.3Å apart → too_close_together by 2.6Å
- **K72** — severity 2.29, 2 conflict(s); suspect input ~`Y79` (group: push_out)
  - push-out (wants farther): A83@22.3Å(now 19.7,conf 0.66)
  - A83↔Y79: targets 22.3/15.1Å but partners are 5.1Å apart → too_close_together by 2.1Å
  - A83↔A80: targets 22.3/14.9Å but partners are 5.3Å apart → too_close_together by 2.1Å

## Secondary Structure (DSSP-like)

- helix(H)=31 · strand(E)=38 · 3-10(G)=25 · coil(C)=11

```
CEGGGHCEEGHHHEEEGHEGGCEGEGEEGHHHEHHEEHHHGHEEEEEEEHEHHEEGHHHGGHHHEEHHECECGGGGHHEEHHEGGCHCEGEEHECEEGGGGCCEC
```

## Backbone H-bond Network

- total=65 · helix(i→i+4)=11 · sheet=54
  - E30 ↔ K34  (helix)
  - D31 ↔ F35  (helix)
  - K34 ↔ S38  (helix)
  - F35 ↔ R39  (helix)
  - S38 ↔ N42  (helix)
  - E53 ↔ G57  (helix)
  - W58 ↔ V62  (helix)
  - E59 ↔ A63  (helix)
  - Q64 ↔ G68  (helix)
  - P77 ↔ Y81  (helix)
  - D78 ↔ G82  (helix)
  - P8 ↔ F14  (sheet)
  - G9 ↔ F14  (sheet)
  - G9 ↔ P15  (sheet)
  - F14 ↔ Q19  (sheet)
  - P15 ↔ V23  (sheet)
  - V23 ↔ S37  (sheet)
  - V23 ↔ K43  (sheet)
  - Y25 ↔ D36  (sheet)
  - Y25 ↔ S37  (sheet)
  - … +45 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=28 · exposed=51 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=450 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=262 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.7363 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=7 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 88 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
